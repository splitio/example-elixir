defmodule ExampleElixirTest.Router do
  use ExUnit.Case, async: true

  use Plug.Test

  @opts ExampleElixir.Router.init([])

  test "/feature-flag-names" do
    conn = conn(:get, "/feature-flag-names")

    conn = ExampleElixir.Router.call(conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200

    assert conn.resp_body == "[]"
  end

  test "/get-treatment" do
    conn = conn(:get, "/get-treatment?key=emi&feature-flag-name=non-existent-flag")

    conn = ExampleElixir.Router.call(conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200

    assert conn.resp_body == "control"
  end
end
