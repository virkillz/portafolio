defmodule PortafolioWeb.Router do
  use PortafolioWeb, :router

  # -----------------pipeline ----------------

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
    plug(PortafolioWeb.Plugs.SetCurrentUser)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  pipeline :auth do
    plug(Portafolio.Auth.AuthAccessPipeline)
  end

  # ----------------- scope route ----------------

  scope "/admin", PortafolioWeb do
    # Use the default browser stack
    pipe_through([:browser, :auth])

    get("/", UserController, :dashboard)
    get("/profile", UserController, :profile)
    get("/locked", UserController, :locked)
    resources("/activity", ActivityController, only: [:index, :show, :delete])
    resources("/user", UserController)
    get("/logout", UserController, :logout)
  end

  scope "/", PortafolioWeb do
    pipe_through(:browser)

    get("/", PageController, :index)
    get("/login", PageController, :login)
    get("/lgn", PageController, :lgn)
    get("/register", PageController, :register)
    post("/login", PageController, :auth)
    post("/register", PageController, :createuser)
    get("/recover", PageController, :recover)
    get("/admin/login", UserController, :login)
    post("/admin/login", UserController, :auth)
    get("/signout", PageController, :signout)
  end

  # Other scopes may use custom stacks.
  # scope "/api", PortafolioWeb do
  #   pipe_through :api
  # end
end
