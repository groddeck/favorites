require_relative '../../lib/scanner.rb'

describe Scanner do
  describe '.process' do
    context 'with no arguments' do
      it 'prints usage message' do
        expect(Scanner).to receive(:usage)
        Scanner.process []
      end
    end

    context 'with one argument' do
      it 'reads from the given input file and writes to console' do
        infile = double('File')
      	expect(File).to receive(:open).with('infile').and_return(infile)
      	allow(infile).to receive(:each_line).and_return(['input1', 'input2'])
      	allow(Scanner).to receive(:popular_pairs).with(['input1', 'input2']).and_return([['row1'], ['row2']])
      	expect(STDOUT).to receive(:puts).with("row1\nrow2")
      	Scanner.process ['infile']
      end
    end

    context 'with two arguments' do
      it 'reads from the given input file and writes to the given output file' do
        infile = double('File')
      	expect(File).to receive(:open).with('infile').and_return(infile)
      	allow(infile).to receive(:each_line)
      	allow(Scanner).to receive(:popular_pairs).and_return([['row1'], ['row2']])
      	outfile = double('File')
      	expect(File).to receive(:open).with('outfile', 'w').and_return(outfile)
      	expect(outfile).to receive(:puts).with("row1\nrow2")
      	Scanner.process ['infile', 'outfile']
      end
    end

    context 'with more than two arguments' do
      it 'prints usage message' do
        expect(Scanner).to receive(:usage)
        Scanner.process ['a', 'b', 'c']
      end
    end
  end

  describe '.popular_pairs' do
    before do
      allow(Scanner).to receive(:min).and_return(2)
    end

    context 'with no rows' do
      it 'returns an empty result set' do
        expect(Scanner.popular_pairs([]) ).to eq []
      end
    end

    context 'with one row' do
      it 'returns an empty result set' do
        expect(Scanner.popular_pairs(['a,b']) ).to eq []
      end
    end

    context 'with multiple rows' do
      context 'having no overlap' do
        it 'returns an empty result set' do
          expect(Scanner.popular_pairs(['a,b', 'c,d']) ).to eq []
        end
      end

      context 'having overlap' do
        it 'returns the pair seen at least MIN times together' do
          expect(Scanner.popular_pairs(['a,b,c', 'b,c,d'])).to eq [['b','c']]
        end
      end
    end
  end
end
