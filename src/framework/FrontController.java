package framework;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet qui g�re la distribution des t�ches et l'ex�cution de l'action et des jsp sp�cifiques.
 */
public class FrontController extends HttpServlet {
	private static final long	serialVersionUID	= 1L;
	
	/**
	 * Message g�n�rale du site.
	 */
	private String message = null;
	
	/**
	 * Nom de la page cible.
	 */
	private String page = null;
	
	/**
	 * Param�tre d'url.
	 */
	private String params_url = null;
	
	/**
	 * Session courante.
	 */
	private Session session = null;
	
	/**
	 * Utilisateur courant.
	 */
	private Object user = null;
	
	/**
	 * Arr�te la requ�te courante.
	 */
	private boolean exit = false;
	
	/**
	 * Constructeur.
	 */
	public FrontController() {
		super();
	}

	/**
	 * Methode de reception des param�tres GET.
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		this.init(request,response);
	}

	/**
	 * Methode de reception des param�tres POST.
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		this.init(request,response);
	}
	
	/**
	 * Affichage un message g�n�ral sur le site. Un seul message peut etre envoy�, les pr�c�dents seront �cras�. 
	 * @param mes String message � envoyer.
	 */
	public void message(String mes) {
		this.message = mes;
	}
	
	/**
	 * Change la page courante.
	 * @param page String nouvelle page pour la redirection.
	 */
	public void redirect(String page) {
		this.page = page;
	}
	
	/**
	 * Change la page courante en ajoutant des param�tres suppl�mentaires.
	 * @param page String nouvelle page pour la redirection
	 * @param params String param�tre suppl�mentaire sans le premier "&".
	 */
	public void redirect(String page, String params) {
		this.page = page;
		this.params_url = params;
	}
	
	/**
	 * Change la page courante.
	 * @param page String nouvelle page pour la redirection
	 * @param exti boolean Si true, r��criture de l'url
	 */
	public void redirect(String page, boolean exit) {
		if (exit) {
			this.page = page;
			this.exit = true;
		} else {
			this.page = page;
		}
	}
	
	/**
	 * Change la page courante en ajoutant des param�tres suppl�mentaires.
	 * @param page String nouvelle page pour la redirection
	 * @param params String param�tre suppl�mentaire sans le premier "&"
	 * @param exti boolean Si true, r��criture de l'url
	 */
	public void redirect(String page, String params, boolean exit) {
		if (exit) {
			this.page = page;
			this.params_url = params;
			this.exit = true;
		} else {
			this.page = page;
			this.params_url = params;
		}
	}
	
	/**
	 * Initialise la session.
	 * @param req HttpServletRequest la requ�te
	 */
	private void init_session(HttpServletRequest req) {
		this.session = new Session(req);
		this.user = this.session.get_user();
	}
	
	/**
	 * Retourne l'instance de la session.
	 * @return Session la session courante
	 */
	public Session session() {
		return this.session;
	}
	
	/**
	 * Retourne l'utilisateur de la session.
	 * @return Object utilisateur
	 */
	public Object user() {
		return this.user;
	}
	
	/**
	 * G�re les appels aux fonctions et � la jsp. 
	 * Elle fait aussi la gestion des erreurs sur l'appel de la page.
	 * @param request
	 * @param response
	 */
	private void init(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("init");
		//***** REINITIALISATION DES PARAMETRES *****//
		this.exit = false;
		
		//***** DECLARATION DES VARIABLES *****//
		String root = this.get_root();
		String main = "/WEB-INF/main.jsp";
		this.page = request.getParameter("page");
		String dir_css = ToolBox.parse_filename(root.concat("WebContent/WEB-INF/css/"));
		
		//***** GESTION DE LA SESSION *****//
		this.init_session(request);
		
		//***** GESTION DE LA PAGE ET DE L ACTION SPECIFIQUE *****//
		if (this.page == null || this.page.length() == 0) { // Si aucune page renseign�e, on met l'index du site.
			this.page = "index";
		} else { // Sinon on la formate.
			this.page = this.page.toLowerCase();
		}
		Method method = ToolBox.get_method("framework.Action",this.page);
		Action action = new Action(this);
		if (method != null) {
			try {
				request = (HttpServletRequest) method.invoke(action,(Object)request);
			} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {}
		} else {
			this.message = "Impossible de charger la page : " + this.page ;
			this.page = "error";
			request = action.error(request);
		}
		if (this.exit) { // Si un veut changer l'adresse dans le navigateur.
			int pos = root.substring(0,root.length()-1).lastIndexOf('/');
			if (pos < 0) {
				pos = root.substring(0,root.length()-1).lastIndexOf('\\');
			}
			root = root.substring(pos).replace('\\','/');
			try {
				if (this.params_url == null) {
					response.sendRedirect(root + "?page=" + this.page);
				} else {
					response.sendRedirect(root + "?page=" + this.page + "&" + this.params_url);
					this.params_url = null;
				}
			} catch (IOException e) {}
		} else {
			// On v�rifie que la page (le fichier.jsp) existe.
			String filename_page = root.concat("WebContent/WEB-INF/jsp/").concat(this.page).concat(".jsp");
			filename_page = ToolBox.parse_filename(filename_page);
			File file_page =  new File(filename_page);
			if(file_page.exists() == false) { // Si la this.page n'existe pas, on met la this.page d'erreur.
				this.page = "error";
				if (this.page.equals("error")) {
					this.message = "La page que vous demandez n'existe pas";
				} else {
					this.message = "La page, '"+this.page+"', que vous demandez n'existe pas";
				}
			}
			// R�cup�ration du contenu du fichier css g�n�ral (main.css).
			String css = ToolBox.load_file(dir_css + "main.css");
			// R�cup�ration du contenu du fichier css sp�cifique (this.page.css).
			css = css + ToolBox.load_file(dir_css + this.page + ".css");
			
			//***** APPEL DE LA PAGE PRINCIPALE (main.jsp) ET ENVOIE DES INFOS *****//
			RequestDispatcher rd = request.getRequestDispatcher(main);
			request.setAttribute("page","/WEB-INF/jsp/" + this.page + ".jsp");
			request.setAttribute("css",css);
			if (this.message != null) {
				request.setAttribute("main_message",this.message);
				this.message = null;
			} else {
				request.removeAttribute("main_message");
			}
			try {
				rd.forward(request, response);
			}
			catch (IOException | ServletException e) {} 
		}
	}
	
	/**
	 * Fonction qui retourne la racine du projet.
	 * @return String le chemin absolu du projet.
	 */
	public String get_root() {
		String root = getServletContext().getRealPath("/");
		root = root.substring(0,root.indexOf(".metadata")-1).concat(this.getServletContext().getContextPath()).concat("/");
		root = ToolBox.parse_filename(root);
		return root;
	}

}
