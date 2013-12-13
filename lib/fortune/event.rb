module Fortune

  class Event
    attr_accessor :has_come, :name, :m, :n
    def initialize(h = {})
      @has_come = false
      [:name, :n, :m].each{|k| instance_variable_set("@#{k}", h[k])}
    end
    def p(h = {})
      P.new(:m => self.m, :n => h[:n] || self.n).value
    end
    def try(h = {})
      @has_come = P.is(self.m, h[:n] || self.n)
      self
    end
    def has_come?
      @has_come
    end
    def set_come
      @has_come = true
    end
    def self.list(h = {})
      EventList.new(h).calc
    end
    def self.select(h = {})
      Event.list(h).active.name
    end
  end

end