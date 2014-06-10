package framework;

import graphview.edge;
import graphview.node;

import java.io.IOException;
import java.io.StringWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

import dao.*;

/**
 * Classe qui definie les actions specifiques pour chaque page.
 */
public class Action {
	FrontController parent = null;
	String colorTab[] = { "#FDAE6B", "#A1D99B", "#9ECAE1", "#31A354",
			"#3182BD", "#FD8D3C", "#A1D99B", "#C6DBEF", "#FDD0A2" };

	public Action(FrontController parent) {
		this.parent = parent;
	}

	public HttpServletRequest addvisit(HttpServletRequest req,
			HttpServletResponse response) {
		User u = User.getInstance();
		if (u == null) {
			this.parent.redirect("login", true);
			return req;
		} else {
			String id = req.getParameter("id");
			Url url = u.getUrlById(Integer.valueOf(id));
			url.addVisit();
			return req;
		}
	}

	public HttpServletRequest tagbyid(HttpServletRequest req,
			HttpServletResponse response) {
		User user = User.getInstance();
		if (user == null) {
			this.parent.redirect("login", true);
			return req;
		} else {

			String id = req.getParameter("id");
			List<Tag> tags = user.getAllTag();
			int nbTags = tags.size();
			List<Url> urls = user.getAllUrl();
			int nbUrls = urls.size();
			List<Url> untaggedUrls = user.getUntaggedUrl();
			int nbUntaggedUrls = untaggedUrls.size();
			Tag tag = user.getTagById(Integer.valueOf(id));
			List<Url> listUrls = tag.getUrls();

			req.setAttribute("tag", tag);
			req.setAttribute("nbTags", nbTags);
			req.setAttribute("nbUrls", nbUrls);
			req.setAttribute("nbUntaggedUrls", nbUntaggedUrls);
			req.setAttribute("listUrls", listUrls);
			return req;
		}
	}

	public HttpServletRequest removeurlfromtag(HttpServletRequest req,
			HttpServletResponse response) {
		User user = User.getInstance();
		if (user == null) {
			this.parent.redirect("login", true);
			return req;
		} else {
			int urlId = Integer.parseInt(req.getParameter("urlid"));
			int tagId = Integer.parseInt(req.getParameter("tagid"));
			user.removeUrlFromTag(urlId, tagId);
			user.setuTagMap(null);
			user.addAllMap();
			return req;
		}
	}

	public HttpServletRequest removeurlfrombdd(HttpServletRequest req,
			HttpServletResponse response) {
		User user = User.getInstance();
		if (user == null) {
			this.parent.redirect("login", true);
			return req;
		} else {
			int urlId = Integer.parseInt(req.getParameter("urlid"));
			user.removeUrlFromBdd(urlId);
			user.setuTagMap(null);
			user.addAllMap();
			user.setuUrls(null);
			user.addAllUrl();
			return req;
		}
	}

	public HttpServletRequest index(HttpServletRequest req,
			HttpServletResponse response) {
		return req;
	}

	public HttpServletRequest error(HttpServletRequest req,
			HttpServletResponse response) {
		return req;
	}

	/**
	 * Fonction deconnexion
	 * 
	 * @param req
	 *            : HttpServletRequest
	 * @return HttpServletRequest
	 **/
	public HttpServletRequest deconnexion(HttpServletRequest req,
			HttpServletResponse response) {
		User user = User.getInstance();
		if (user == null) {
			this.parent.redirect("login", true);
			return req;
		} else {
			user.deleteUser();
			this.parent.redirect("login");
			this.parent.session().close();
			return req;
		}
	}

	public HttpServletRequest accueil(HttpServletRequest req,
			HttpServletResponse response) {
		User user = User.getInstance();
		if (user == null) {
			this.parent.redirect("login", true);
			return req;
		} else {
			List<Tag> tags = user.getAllTag();
			int nbTags = tags.size();
			List<Url> urls = user.getAllUrlOrderBy();
			int nbUrls = urls.size();
			List<Url> untaggedUrls = user.getUntaggedUrl();
			int nbUntaggedUrls = untaggedUrls.size();
			Map<Tag, List<Url>> mapTagUrls = new HashMap<Tag, List<Url>>();

			if (tags != null) {
				Iterator<Tag> it = tags.iterator();
				while (it.hasNext()) {
					Tag tag = it.next();
					mapTagUrls.put(tag, tag.getUrls());
				}
			}

			req.setAttribute("tags", tags);
			req.setAttribute("urls", urls);
			req.setAttribute("untaggedurls", untaggedUrls);
			req.setAttribute("mapTagUrls", mapTagUrls);
			req.setAttribute("nbTags", nbTags);
			req.setAttribute("nbUrls", nbUrls);
			req.setAttribute("nbUntaggedUrls", nbUntaggedUrls);
			return req;
		}
	}

	/**
	 * Fonction login Gere la connexion de l'utilisateur lors de son arrivee
	 * dans l'application
	 * 
	 * @param req
	 *            : HttpServletRequest
	 **/

	public HttpServletRequest login(HttpServletRequest req,
			HttpServletResponse response) {
		String email = req.getParameter("email");
		String mdp = req.getParameter("password");
		boolean access = false;
		User user;
		if (email != null) {
			try {
				user = User.getInstance(email, mdp);
				System.out.println(email);
				System.out.println(mdp);
				if (user != null) {
					Cookie userCookie = new Cookie("userId",
							Integer.toString(user.getuId()));
					response.addCookie(userCookie);
					this.parent.session().open(user);
					this.parent.redirect("accueil", true);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return req;
	}

	public HttpServletRequest graph(HttpServletRequest req,
			HttpServletResponse response) throws SQLException {
		User user = User.getInstance();
		if (user == null) {
			this.parent.redirect("login", true);
			return req;
		} else {
			List<Tag> listTags = user.getAllTag();
			Iterator<Tag> it = listTags.iterator();
			node instTag = null;
			Tag currentTag = null;
			List<node> nodes = new ArrayList<node>();
			List<edge> links = new ArrayList<edge>();
			int ind = 0;
			double maxUrl = 0;
			while (it.hasNext()) {
				currentTag = (Tag) it.next();
				if (currentTag.getUrls().size() != 0) {
					instTag = new node(currentTag.getTid(),
							currentTag.gettName(), currentTag.getUrls().size(),
							currentTag);
					if (maxUrl < currentTag.getUrls().size())
						maxUrl = currentTag.getUrls().size();
					instTag.setIndex(ind);
					instTag.setColorId(ind);
					nodes.add(instTag);
					instTag = null;
					ind++;
				}
			}

			// ratio taille des noeuds
			for (int i = 0; i < nodes.size(); i++) {
				nodes.get(i).setSize(nodes.get(i).getSize() / maxUrl);
			}

			List<Url> listUrls = user.getAllUrl();
			// Iterator<Url> itUri=listUrls.iterator();
			Url currentUrl;
			for (int k = 0; k < listUrls.size(); k++) {
				currentUrl = (Url) listUrls.get(k);
				if (currentUrl.getTags().size() > 1) {
					edge instEdge = null;
					for (int i = 0; i < nodes.size(); i++) {
						for (int j = i + 1; j < nodes.size(); j++) {
							if (currentUrl.getTags().contains(
									(Tag) nodes.get(i).getTag())
									&& currentUrl.getTags().contains(
											(Tag) nodes.get(j).getTag())) {
								instEdge = new edge(nodes.get(i).getIndex(),
										nodes.get(j).getIndex());
								links.add(instEdge);
								instEdge = null;
							}
						}
					}
				}
			}
			coloration(nodes, links);
			req.setAttribute("json_links", links.toString());
			req.setAttribute("json_nodes", nodes.toString());

			return req;
		}
	}

	private void coloration(List<node> nodes, List<edge> edges) {

		for (int i = 0; i < edges.size(); i++) {
			node source = nodes.get(edges.get(i).getSource());
			node target = nodes.get(edges.get(i).getTarget());
			if (source.getColorId() != target.getColorId()) {
				for (int j = 0; j < nodes.size(); j++) {
					if (nodes.get(j).getColorId() == target.getColorId()) {
						nodes.get(j).setColorId(source.getColorId());
					}
				}
			}
		}

		for (int i = 0; i < nodes.size(); i++) {
			node n = nodes.get(i);
			n.setColor(colorTab[n.getColorId() % 9]);
		}

	}

	public HttpServletRequest graphview(HttpServletRequest req,
			HttpServletResponse response) throws SQLException {
		return req;
	}

	/**
	 * Fonction tableauBord Gere la page tableau de bord de l'application
	 * 
	 * @param req
	 *            : HttpServletRequest
	 **/

	public HttpServletRequest tableaubord(HttpServletRequest req,
			HttpServletResponse response) {
		User user = User.getInstance();
		if (user == null) {
			this.parent.redirect("login", true);
			return req;
		} else {
			List<Tag> tags = user.getAllTag();
			int nbTags = tags.size();
			List<Url> urls = user.getAllUrl();
			int nbUrls = urls.size();
			List<Url> untaggedUrls = user.getUntaggedUrl();
			int nbUntaggedUrls = untaggedUrls.size();
			Map<Tag, List<Url>> mapTagUrls = new HashMap<Tag, List<Url>>();

			if (tags != null) {
				Iterator<Tag> it = tags.iterator();
				while (it.hasNext()) {
					Tag tag = it.next();
					mapTagUrls.put(tag, tag.getUrls());
				}
			}
			req.setAttribute("tags", tags);
			req.setAttribute("urls", urls);
			req.setAttribute("untaggedurls", untaggedUrls);
			req.setAttribute("mapTagUrls", mapTagUrls);
			req.setAttribute("nbTags", nbTags);
			req.setAttribute("nbUrls", nbUrls);
			req.setAttribute("nbUntaggedUrls", nbUntaggedUrls);
			return req;
		}
	}

	public HttpServletRequest ajoutertag(HttpServletRequest req,
			HttpServletResponse response) throws SQLException {
		User user = User.getInstance();
		if (user == null) {
			this.parent.redirect("login", true);
			return req;
		} else {
			List<Tag> allTags = user.getAllTag();
			List<Url> allUrls = user.getUntaggedUrl();
			req.setAttribute("tags", allTags);
			req.setAttribute("untaggedurls", allUrls);
			return req;
		}
	}

	public HttpServletRequest ajoutertagurl(HttpServletRequest req,
			HttpServletResponse response) throws SQLException {
		User user = User.getInstance();
		if (user == null) {
			this.parent.redirect("login", true);
			return req;
		} else {
			String id = req.getParameter("id");
			List<Tag> allTags = user.getAllTag();
			Url url = user.getUrlById(Integer.parseInt(id));
			List<Url> allUrls = new ArrayList<Url>();
			allUrls.add(url);
			req.setAttribute("tags", allTags);
			req.setAttribute("urls", allUrls);
			return req;
		}
	}

	public HttpServletRequest addurl(HttpServletRequest req,
			HttpServletResponse response) {
		int idUser = Integer.parseInt(req.getParameter("id"));
		String siteUrl = req.getParameter("url");
		String nomUrl = req.getParameter("nomUrl");
		Url url = new Url(idUser, siteUrl, nomUrl, 0);
		try {
			url.addUrlToDBB();
			url.setuId(url.getIdFromBDD());
			User user = (User) this.parent.user();
			user.addOneUrl(url);
			response.setStatus(200);
		} catch (MySQLIntegrityConstraintViolationException e) {
			// URL existe d�j� dans la BDD
			System.out.println("URL duppliquee");
			response.setStatus(201);

		} catch (SQLException e) {
			// erreur dans l'insertion a la BDD
			e.printStackTrace();
			response.setStatus(400);
		}

		return req;
	}

	public HttpServletRequest addtagurl(HttpServletRequest req,
			HttpServletResponse response) throws SQLException {
		User user = User.getInstance();
		if (user == null) {
			this.parent.redirect("login", true);
			return req;
		} else {

			String uri = (String) req.getParameter("url");
			String listTag = (String) req.getParameter("list");
			Url url = user.getUrlById(Integer.valueOf(uri));
			String str[] = listTag.split("@");
			for (int i = 0; i < str.length; i++) {
				Tag tag = user.getTagByName(str[i]);
				if (tag == null) {
					// add tag
					tag = new Tag(str[i], user.getuId());
					tag.addTagtoBDD();
					tag.setTid(tag.getTagIdFromBDD());
					user.addOneTag(tag);
				}
				if (!url.hasTag(tag)) {
					TagMap tm = new TagMap(tag, url);
					tm.addTagMaptoBDD(user.getuId());
					tm.setTmId(tm.getIdFromBdd());
					user.addOneMap(tm);
				}
			}
			return req;
		}
	}

	public HttpServletRequest suggestion(HttpServletRequest req,
			HttpServletResponse response) throws SQLException {
		User user = User.getInstance();
		return req;
	}

}

