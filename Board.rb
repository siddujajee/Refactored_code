class Board
    attr_reader :locations
    def initialize
        @locations=[nil, nil, nil, nil, nil, nil, nil, nil, nil]
    end
    def render
        puts "  #{locations[0]&.mark || " "} | #{locations[1]&.mark || " "} | #{locations[2]&.mark || " "}"
        puts "-------------"
        puts "  #{locations[3]&.mark || " "} | #{locations[4]&.mark || " "} | #{locations[5]&.mark || " "}"
        puts "-------------"
        puts "  #{locations[6]&.mark || " "} | #{locations[7]&.mark || " "} | #{locations[8]&.mark || " "}"
    end

    def avaiable?(location)
        locations[location-1]==nil
    end
    def set(location, player)
        locations[location-1]=player
    end

    def win
        row=[locations[0], locations[1], locations[2]].compact
        return row.first if row.length==3 && row.all? {|r| r==row.first}

        row=[locations[3], locations[4], locations[5]].compact
        return row.first if row.length==3 && row.all? {|r| r==row.first}

        row=[locations[6], locations[7], locations[8]].compact
        return row.first if row.length==3 && row.all? {|r| r==row.first}

        row=[locations[0], locations[3], locations[6]].compact
        return row.first if row.length==3 && row.all? {|r| r==row.first}

        row=[locations[1], locations[4], locations[7]].compact
        return row.first if row.length==3 && row.all? {|r| r==row.first}

        row=[locations[2], locations[5], locations[8]].compact
        return row.first if row.length==3 && row.all? {|r| r==row.first}

        row=[locations[0], locations[4], locations[8]].compact
        return row.first if row.length==3 && row.all? {|r| r==row.first}

        row=[locations[2], locations[4], locations[6]].compact
        return row.first if row.length==3 && row.all? {|r| r==row.first}
        
       
    end

    def draw
        locations.none?(nil) && !win
    end
end