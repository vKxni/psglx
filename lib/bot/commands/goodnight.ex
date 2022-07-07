defmodule Psglx.Commands.Night do
  @moduledoc false

  @behaviour Psglx.Command

  alias Nostrum.Api
  alias Psglx.Command

  @impl Command

  def spec(name) do
    %{
      name: name,
      description: "Wish someone a good night!",
      options: [
        %{
          type: 6,
          name: "user",
          description: "Who do you want to wish a good night?",
          required: true
        }
      ]
    }
  end

  @impl Command
  def handle_interaction(interaction) do
    %{value: name} = Command.get_option(interaction, "user")

    # fetch a random image
    random =
      File.stream!("goodnight.txt")
      |> Enum.random()

    # wrap everything into an embed and send it into the channel
    embed = %Nostrum.Struct.Embed{
      description: "Good night <@#{name}>! 🌙\n\nSleep well and come back soon 😴",
      thumbnail: %Nostrum.Struct.Embed.Thumbnail{
        url: random
      }
    }

    Api.create_interaction_response(interaction, %{
      type: 4,
      data: %{embeds: [embed]}
    })
  end
end
