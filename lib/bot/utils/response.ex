defmodule Psglx.Utils.InteractionResponse do
  @moduledoc """
  Util functions for (ephemeral) interaction responses
  """

  import Bitwise

  alias Nostrum.{Api, Struct.Interaction}

  require Logger

  @spec send_ephemeral(Interaction.t(), binary()) :: {:ok}
  def send_ephemeral(%Interaction{} = interaction, content) do
    Logger.debug("Sending ephemeral response to interaction #{interaction.id}")

    response = %{
      type: 4,
      data: %{
        content: content,
        flags: 1 <<< 6 # ephemeral
      }
    }

    Api.create_interaction_response(interaction, response)
  end

  @doc """
  This is a simple function for sending interaction responses
  """
  @spec send_response(Interaction.t(), binary()) :: {:ok}
  def send_response(%Interaction{} = interaction, content) do
    Logger.debug("Sending response, waiting for success ...")

    response = %{
      type: 4,
      data: %{
        content: content
      }
    }

    Api.create_interaction_response(interaction, response)
  end
end
