class LexoRank
  @@min_char = '0'
  @@max_char = 'z'

  def self.get_rank(prev='', after='')
    prev = @@min_char if prev == ''
    after = @@max_char if after == ''

    rank = ''
    i = 0

    while true
      prev_char = get_char(prev, i, @@min_char)
      after_char = get_char(after, i, @@max_char)

      # binding.pry

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
