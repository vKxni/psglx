defmodule Psglx.Consumer.Supervisor do
  use Supervisor

  @moduledoc """

  DOCS: https://hexdocs.pm/elixir/Supervisor.html

  A supervisor is a process which supervises other processes, which we refer to as child processes.
  Supervisors are used to build a hierarchical process structure called a supervision tree.
  Supervision trees provide fault-tolerance and encapsulate how our applications start and shutdown.

  A supervisor may be started directly with a list of children via start_link/2 or
  you may define a module-based supervisor that implements the required callbacks.
  The sections below use start_link/2 to start supervisors in most examples,
  but it also includes a specific section on module-based ones.

  Here, I use the supervision module, however, you can also create it
  by passing the supervision structure to start_link/2
  """

  def start_link(args) do
    Supervisor.start_link(__MODULE__, args, name: __MODULE__)
  end

  @impl true
  def init(_init_arg) do
    children = [
      Psglx.Consumer
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
