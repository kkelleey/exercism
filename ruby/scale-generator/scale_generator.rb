class Scale
  CHROMATIC_SCALE = {
    sharps: %w(A A# B C C# D D# E F F# G G#),
    flats:  %w(A Bb B C Db D Eb E F Gb G Ab)
  }.freeze

  TONICS = {
    sharps: %w(C G D A E B F# a e b f# c# g# d#),
    flats: %w(F Bb Eb Ab Db Gb d g c f bb eb)
  }.freeze

  STEPS = {
    'm' => 1,
    'M' => 2,
    'A' => 3
  }.freeze

  def initialize(note, mode, steps = 'm' * 12)
    @note = note
    @mode = mode
    @steps = steps
  end

  def name
    "#{@note.upcase} #{@mode}"
  end

  def pitches
    index = scale.index(@note.capitalize)
    @steps.chars.each_with_object([]) do |step, pitches|
      pitches << scale[index % 12]
      index += STEPS[step]
    end
  end

  def scale
    CHROMATIC_SCALE[tonic]
  end

  def tonic
    TONICS.find { |_, v| v.include? @note }.first
  end
end
