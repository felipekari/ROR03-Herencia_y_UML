class Appointment
    attr_reader :location, :purpose, :hour, :min
    
    def initialize(location, purpose, hour, min)
      @location = location
      @purpose = purpose
      @hour = hour
      @min = min
      raise ArgumentError, 'Locacion debe ser un string' unless location.kind_of?(String)
      raise ArgumentError, 'Proposito debe ser un string' unless purpose.kind_of?(String)
      raise ArgumentError, 'Hora debe ser un integer' unless hour.kind_of?(Integer)
      raise ArgumentError, 'Minuto debe ser un integer' unless min.kind_of?(Integer)
    end

end

class MonthlyAppointment < Appointment
    attr_reader :day

    def initialize(location, purpose, hour, min, day)
        super(location, purpose, hour, min)
        @day = day
        raise ArgumentError, 'Dia debe ser un integer' unless day.kind_of?(Integer)
    end

    def occurs_on?(day)
        @day == day
    end

    def to_s
        return "Reunión mensual en #{@location} sobre #{@purpose} el dia #{@day} a la(s) #{@hour}:#{@min}"
    end

end

class DailyAppointment < Appointment

    def occurs_on?(hour, min)
        [@hour, @min] == [hour, min]
    end

    def to_s
       return "Reunión diaria en #{@location} sobre #{@purpose} a la(s) #{@hour}:#{@min}" 
    end

end

class OneTimeAppointment < Appointment
    attr_reader :day, :month, :year
    
    def initialize(location, purpose, hour, min, day, month, year)
      super(location, purpose, hour, min)
      @day = day
      @month = month
      @year = year
      raise ArgumentError, 'Dia debe ser un integer' unless day.kind_of?(Integer)
      raise ArgumentError, 'Mes debe ser un integer' unless month.kind_of?(Integer)
      raise ArgumentError, 'Año debe ser un integer' unless year.kind_of?(Integer)
    end

    def occurs_on?(day, month, year)
        [@day, @month, @year] == [day, month, year]
    end

    def to_s
        return "Reunion única en #{@location} sobre #{@purpose} el #{@day}/#{@month}/#{@year} a la(s) #{@hour}:#{@min}"
    end

end

cita1 = MonthlyAppointment.new('Santiago', 'Dentista', 9, 30, 16)
puts cita1
puts cita1.occurs_on?(16)