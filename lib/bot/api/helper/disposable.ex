defmodule Psglx.Disposable do
  @type email_type() :: String.t()
  @spec disposable(email_type()) :: boolean()

  def disposable(email) when is_binary(email) do
    url = Application.get_env(:psglx, :disposable)

    with {:ok, %{body: body}} <- Psglx.Base.get(url <> email) do
      body |> Poison.decode!() |> Map.get("disposable")
    end
  end
end
