module Fortune

  class EventList < Array
    attr_accessor :sum_m, :intervals, :n
    def initialize(h = {})
      h.each{|name, m| self.push(Event.new({:name => name, :m => m}))}
      @sum_m = 0
      @intervals = {}
    end
    def calc
      self.calc_sum_m
      self.calc_intervals
      self.get_n
      self.set_active
      self
    end
    def set_active
      self.map{|event|
        next if event.m <= 0
        event.set_come if self.n >= intervals[event.name][0] && self.n <= intervals[event.name][1]
      }
    end
    def get_n
      @n = P.n(self.sum_m)
    end
    def calc_sum_m
      self.map{|event|
        next if event.m <= 0
        self.sum_m += event.m
      }
    end
    def calc_intervals
      x = 0
      self.map{|event|
        next if event.m <= 0
        self.intervals[event.name] = [x + 1, x + event.m]
        x = x + event.m
      }
    end
    def active
      self.select{|event| event.has_come?}.first
    end
  end

end