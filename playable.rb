module Playable
  def blam
    @decreased_health = @health -= 10
  end

  def w00t
    @increased_health = @health += 15
  end

  def strong?
    @health > 100
  end
end
