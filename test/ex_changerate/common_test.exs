defmodule ExChangerate.CommonTest do
  @moduledoc false
  use ExUnit.Case, async: true

  test "returns valid base for given endpoint" do
    endpoint = "/test"

    assert(ExChangerate.Common.base(endpoint), ExChangerate.base_url() <> endpoint)
  end
end
