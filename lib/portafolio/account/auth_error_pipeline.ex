defmodule Portafolio.Auth.AuthErrorHandler do
  @moduledoc false

  import Plug.Conn

  def auth_error(conn, {_type, _reason}, _opts) do
    Phoenix.Controller.redirect(conn, to: "/admin/login")
    # body = Poison.encode!(%{message: to_string(type)})
    # send_resp(conn, 401, body)
  end
end
