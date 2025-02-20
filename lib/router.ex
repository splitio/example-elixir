defmodule ExampleElixir.Router do
  # Bring Plug.Router module into scope
  use Plug.Router

  # Attach the Logger to log incoming requests
  plug(Plug.Logger)

  # Tell Plug to match the incoming request with the defined endpoints
  plug(:match)

  # Once there is a match, parse the incoming request
  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  # Dispatch the connection to the matched handler
  plug(:dispatch)

  # Handler for GET request with "/feature-flag-names" path
  get "/feature-flag-names" do
    feature_flag_names = Split.split_names()

    send_resp(conn, 200, Jason.encode!(feature_flag_names))
  end

  # Handler for GET request with "/get-treatment?key=<USER-ID>&feature-flag-name=<FEATURE-FLAG-NAME>" path
  get "/get-treatment" do
    split_key = conn.query_params["key"]
    feature_flag_name = conn.query_params["feature-flag-name"]

    treatment =
      Split.get_treatment(
        split_key,
        feature_flag_name
      )

    send_resp(conn, 200, treatment)
  end

  # Fallback handler when there was no match
  match _ do
    send_resp(
      conn,
      404,
      "Not Found, try '/feature-flag-names'"
    )
  end
end
