defmodule Psglx.Commands.DisposableTest do
  use ExUnit.Case, async: true

  alias Psglx.Commands.Disposable

  test "disposable/1 returns true for disposable emails" do
    assert Disposable.disposable("koni@yopmail.com")
