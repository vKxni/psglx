defmodule Psglx.Commands.Intro do
  @moduledoc false

  @behaviour Psglx.Command

  alias Nostrum.Api
  alias Psglx.Command

  @impl Command
  def spec(name) do
    %{
      name: name,
      description: "A small intro of myself"
    }
  end

  @impl Command
  def handle_interaction(interaction) do
    embed = %Nostrum.Struct.Embed{
      description:
        "Hello there #{interaction.user}, let me introduce myself!\n\nI'm \`Psglx\`, a bot made by **Koni#9521**.\nI have a lot of fun commands, and I'm constantly improving myself.\n\nI'm currently in **development**, so I'm not sure if I'll be able to do much more than what I already have.\n\nIf you have any questions, feel free to ask me!",
      thumbnail: %Nostrum.Struct.Embed.Thumbnail{
        url:
          "https://images-ext-1.discordapp.net/external/rDN1l5js_itKv7r3H63hu9p81P-my2OiiqKAOXk3eWk/https/cdn.discordapp.com/avatars/945313842337042442/d2e7c0ed02fff6c1d314c2676f832b5f.png"
      },
      footer: %Nostrum.Struct.Embed.Footer{
        text: "Version: Psglx v1.3.0",
        icon_url:
          "https://images-ext-1.discordapp.net/external/rDN1l5js_itKv7r3H63hu9p81P-my2OiiqKAOXk3eWk/https/cdn.discordapp.com/avatars/945313842337042442/d2e7c0ed02fff6c1d314c2676f832b5f.png"
      },
      # black
      color: 000_000
    }

    Api.create_interaction_response(interaction, %{
      type: 4,
      data: %{embeds: [embed]}
    })
  end
end
