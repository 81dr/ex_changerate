defmodule ExChangerate do
  @moduledoc false

  @service Application.get_env(:ex_changerate, :api_instance)

  def base_url do
    @service
  end
end
