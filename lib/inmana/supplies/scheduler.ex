defmodule Inmana.Supplies.Scheduler do
  use GenServer
  @moduledoc """
  Agendamento de jobs
  """
  alias Inmana.Supplies.ExpirationNotification

  # CLIENT

  def start_link(_state) do
    GenServer.start_link(__MODULE__, %{})
  end

  # SERVER

  @impl true
  def init(state \\ %{}) do # \\ definição de valor default
    schedule_notification()
    {:ok, state}
  end

  @impl true
  def handle_info(msg, state) do
    ExpirationNotification.send()

    schedule_notification()

    {:noreply, state}
  end

  def schedule_notification() do
    Process.send_after(self(), :generate, 1000 * 10) #envia o email a cada 10 segundos
  end


#  #async
#  def handle_cast({:put, key, value}, state) do
#    {:noreply, Map.put(state, key, value)}
#  end
#
#  #sync
#  def handle_call({:get, key}, _from, state) do
#    {:reply, Map.get(state, key), state}
#  end

end