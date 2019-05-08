class LexoRank
  MIN_CHAR = '0'.freeze
  MAX_CHAR = 'z'.freeze

  def self.get_rank(prev='', after='')
    prev = MIN_CHAR if prev == ''
    after = MAX_CHAR if after == ''

    rank = ''
    i = 0

    while true
      prev_char = get_char(prev, i, MIN_CHAR)
      after_char = get_char(after, i, MAX_CHAR)

      if prev_char == after_char
        rank += prev_char
        i += 1
        next
      end

      mid_char = mid(prev_char, after_char)
      if mid_char == prev_char || mid_char == after_char
        rank += prev_char
        i += 1
        next
      end

      rank += mid_char
      break
    end

    rank >= after ? prev : rank
  end

  private

  def self.mid(prev, after)
    middle_ascii = ((prev.ord + after.ord) / 2).round
    middle_ascii.chr
  end

  def self.get_char(str, i, default_char)
    i >= str.length ? default_char : str[i]
  end

end
