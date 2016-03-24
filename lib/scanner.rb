class Scanner
  USAGE_MESSAGE = 'Usage:   ruby favorites.rb input-file [output-file]'
  MIN = 50

  def self.process(args)
    unless [1,2].include? args.length
      usage
    else
      infile = File.open(args.first)
      outfile = args[1] ? File.open(args[1],'w') : STDOUT
      rows = read_file(infile)
      pairs = popular_pairs(rows)
      write_file(outfile, pairs)
    end
  end

  def self.usage
    puts USAGE_MESSAGE
    exit 1
  end

  def self.read_file(file)
    file.each_line.to_a
  end

  def self.write_file(file, pairs)
    file.puts pairs.map{|pair| pair.join(',')}.join("\n")
  end

  def self.popular_pairs(rows)
    matrix = []
    rows.each do |row|
      matrix << row.split(',').map{|n| n.delete("\n")}
    end
    artists = {}
    matrix.each_with_index do |row, i|
      row.each do |artist|
        artists[artist] ||= []
        artists[artist] << i
      end
    end
    pop_artists = {}
    artists.each do |artist, rows|
      pop_artists[artist] = rows if rows.count >= min
    end
    pop_pairs = []
    pop_artists.each do |artist_a, rows_a|
      pop_artists.each do |artist_b, rows_b|
        next if artist_a == artist_b
        pop_pairs << [artist_a, artist_b].sort if (rows_a & rows_b).count >= min
      end
    end
    pop_pairs.uniq
  end

  def self.min
    MIN
  end
end
