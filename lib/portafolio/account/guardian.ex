defmodule Portafolio.Auth.Guardian do
  @moduledoc false

  use Guardian, otp_app: :portafolio
  import Ecto.Query, warn: false

  alias Portafolio.Auth.Guardian
  alias Portafolio.Account

  def subject_for_token(user, _claims) do
    sub = to_string(user.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    user = Account.get_user!(id)
    {:ok, user}
  end

  def login(conn, user) do
    conn
    |> Guardian.Plug.sign_in(user)
    |> Plug.Conn.assign(:current_user, user)
  end

  def logout(conn) do
    conn
    |> Guardian.Plug.sign_out()
  end
end
