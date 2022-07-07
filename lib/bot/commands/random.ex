defmodule Psglx.Commands.Random do
  @moduledoc false

  @behaviour Psglx.Command

  alias Nostrum.Api
  alias Psglx.Command
  use Nostrum.Struct.Embed

  @impl Command
  def spec(name) do
    %{
      name: name,
      description: "Returns a random quote"
    }
  end

  @impl Command
  def handle_interaction(interaction) do
    # read the text file && fetch a random quote..

    file =
      File.stream!("random.txt")
      |> Enum.random()

    embed = %Nostrum.Struct.Embed{
      title: "Daily quote",
      description: file,
      color: 000_000
      #  icon_url: "https://media.discordapp.net/attachments/942860191320387587/967350735207542784/quotes.png"
    }

    Api.create_interaction_response(interaction, %{
      type: 4,
      # data: %{content: file}
      data: %{embeds: [embed]}
    })
  end
end
