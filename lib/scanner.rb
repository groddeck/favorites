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
    pairs_freq = Hash.new(0)
    pop_pairs = []
    rows.each do |row|
      row.delete("\n").split(',').permutation(2).map(&:sort).uniq.each do |pair|
        ordered = pair.sort
        pop_pairs << ordered if (pairs_freq[ordered] += 1) == min
      end
    end
    pop_pairs
  end

  def self.min
    MIN
  end
end
