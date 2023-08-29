defmodule UsersApiWeb.Router do
  use UsersApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", UsersApiWeb do
    pipe_through :api
    get "/", UserController, :index
    get "/users", UserController, :index
    put "/users", UserController, :edit
    post "/users", UserController, :create
    delete "/users", UserController, :delete
    # resources "/users", UserController, except: [:new, :edit]
  end


  # socket "/phoenix/live_reload/socket/websocket", Phoenix.LiveReloader.Socket
  # forward "/phoenix/live_reload/socket/websocket", Phoenix.LiveReloader.Socket
  # socket "/phoenix/live_reload/socket/websocket", UsersApiWeb.Phoenix.LiveReloader.Socket


  # Enable LiveDashboard and Swoosh mailbox preview in development
  # if Application.compile_env(:users_api, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
  #   import Phoenix.LiveDashboard.Router

  #   scope "/dev" do
  #     pipe_through [:fetch_session, :protect_from_forgery]

  #     live_dashboard "/dashboard", metrics: UsersApiWeb.Telemetry
  #     forward "/mailbox", Plug.Swoosh.MailboxPreview
  #   end
  # end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router
    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: UsersApiWeb.Telemetry
    end
  end
end
