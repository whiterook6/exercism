defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus
  @earth_period 31557600
  @periods %{
  	:mercury => 0.2408467 * @earth_period,
  	:venus => 0.61519726 * @earth_period,
  	:earth => @earth_period,
  	:mars => 1.8808158 * @earth_period,
  	:jupiter => 11.862615 * @earth_period,
    :saturn => 29.447498 * @earth_period,
    :uranus => 84.016846 * @earth_period,
    :neptune => 164.79132 * @earth_period
  }

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    seconds / @periods[planet]
  end
end
