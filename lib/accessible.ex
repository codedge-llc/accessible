defmodule Accessible do
  @moduledoc false

  defmacro __using__(_) do
    quote location: :keep do
      @behaviour Access

      def delete(struct, key) do
        put(struct, key, struct(__MODULE__)[key])
      end

      @impl Access
      defdelegate fetch(struct, key), to: Map

      def get(struct, key, default \\ nil) do
        case struct do
          %{^key => value} -> value
          _else -> default
        end
      end

      @impl Access
      def get_and_update(struct, key, fun) when is_function(fun, 1) do
        current = get(struct, key)

        case fun.(current) do
          {get, update} ->
            {get, put(struct, key, update)}

          :pop ->
            {current, delete(struct, key)}

          other ->
            raise "the given function must return a two-element tuple or :pop, got: #{inspect(other)}"
        end
      end

      @impl Access
      def pop(struct, key, default \\ nil) do
        val = get(struct, key, default)
        updated = delete(struct, key)
        {val, updated}
      end

      def put(struct, key, val) do
        if Map.has_key?(struct, key) do
          Map.put(struct, key, val)
        else
          struct
        end
      end

      defoverridable delete: 2,
                     fetch: 2,
                     get: 3,
                     get_and_update: 3,
                     pop: 3,
                     put: 3
    end
  end
end
