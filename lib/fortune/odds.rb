module Fortune

  # win
  class Odds
    include Comparable
    attr_accessor :p, :s, :k, :type

    def initialize(h = {})
      # TODO: check p or (s and k) exists
      h[:s] ||= h[:win]
      h[:k] ||= h[:lose]
      [:win, :lose].each{|k| h.delete(k)}

      h.each{|k,v| instance_variable_set("@#{k}", v)}
      self.p = P.new(s, s + k).value unless self.p
      self.calc_s_k if !self.k || !self.s

      self.to_win
    end

    def <=>(other)
      if self.p < other.p
        -1
      elsif self.p > other.p
        1
      else
        0
      end
    end

    def to_i
      self.s, self.k = self.s.to_i, self.k.to_i
      self
    end

    def n_all
      s + k
    end
    alias :variants :n_all

    # h = {:k => int, [:fractions => true]}
    def to_human(h = {:k => 7})
      min_delta = nil
      closest_odd = nil

      Odds.human(h).each{|odd|
        delta = (self.p - odd.p).abs
        if !min_delta || delta < min_delta
          min_delta = delta
          closest_odd = odd
        end
      }

      closest_odd
    end

    def is_on_win?
      self.type == :on_win
    end

    def is_on_lose?
      self.type == :on_lose
    end

    def to_win
      self.s_to_k if self.is_on_lose?
      self.type = :on_win
      self
    end

    def s_to_k
      self.s, self.k = self.k, self.s
    end

    def to_lose
      self.s_to_k if self.is_on_win?
      self.type = :on_lose
      self
    end

    def revert
      self.s_to_k
      self.p = 1 - self.p
      self
    end

    def self.equal
      Odds.new({:s => 1, :k => 1})
    end

    def self.human(h)
      Odds.p_human(h).values
    end

    def to_s
      "#{self.s}:#{self.k} #{self.type} (p: #{p_obj.to_percent_string})"
    end

    def p_obj
      P.new(self.p)
    end

    protected

    def calc_s_k
      self.s = 1
      self.k = s.to_f/p.to_f - s.to_f
    end

    private

    def self.p_human(h)
      p_odds = {Odds.equal.p => Odds.equal}
      (1..h[:k]).each{|k|
        (0..k-1).each{|s|
          Odds.fillup_p_human(p_odds, s, k)
        }
      }

      h[:fractions] ? Odds.add_fractions(p_odds, h) : p_odds
    end

    def self.fillup_p_human(p_odds, s, k)
      odd = Odds.new({:s => s, :k => k})
      odd_dup = odd.dup.revert
      p_odds[odd.p] = odd if not p_odds.has_key?(odd.p)
      p_odds[odd_dup.p] = odd_dup if not p_odds.has_key?(odd_dup.p)
    end

    def self.add_fractions(p_odds, h)
      p_odds_addons = {}
      p_odds.each{|key, odd|
        next if odd.k == h[:k]
        Odds.fillup_p_human(p_odds_addons, odd.s, odd.k + 0.5)
      }
      p_odds_addons.merge(p_odds)
    end
  end

end