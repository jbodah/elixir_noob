# elixir_noob

```
brew install elixir
elixir programming_elixir/hello.exs
```

## Cheatsheet

`find lib test | entr mix test`

### Dependencies

* add to `mix.exs` (both `deps` and `application`)
* `mix deps.get`

### Processes

* `spawn_link` => errors crash parent process
* `spawn` => errors don't crash parent process

### Mix

* start iex with default mix task => `iex -S mix`
* recompile dependencies `mix deps.compile` (for debugging)

### iEX

* `r(Module)` => recompile and reload module interactively :heart:
* `v` => last return value

### OTP

#### `GenServer` - generic server

```ex
defmodule Stack do
  use GenServer

  # Callbacks

  def handle_call(:pop, _from, [h|t]) do
    {:reply, h, t}
  end

  def handle_cast({:push, item}, state) do
    {:noreply, [item|state]}
  end
end

# Start the server
{:ok, pid} = GenServer.start_link(Stack, [:hello])

# This is the client
GenServer.call(pid, :pop)
#=> :hello

GenServer.cast(pid, {:push, :world})
#=> :ok

GenServer.call(pid, :pop)
#=> :world
```

* `cast` => async
* `call` => sync
