require "tic_tac_toe"

describe Game do
  let(:game) {Game.new(["x", "x", "x", " ", " ", " ", " ", " ", " "])}

  describe ".game_won?" do
    context "when top row of board reads XXX" do
      it "returns true" do
        expect(game.game_won?("x")).to eql(true)
      end
    end

    context "when the given value does not appear three times in a row" do
      it "returns false" do
        expect(game.game_won?("o")).to eql(false)
      end
    end
  end

  describe "valid?" do
    context "when space on board is already used" do
      it "returns false" do
        expect(game.valid?("a1", "o")).to eql(false)
      end
    end

    context "when specified space does not exist" do
      it "returns false" do
        expect(game.valid?("d7", "o")).to eql(false)
      end
    end

    context "when space exists and is vacant" do
      it "modifies @places" do
        expect(game.valid?("b1", "o")).to eql("o")
        expect(game.places).to eql(["x", "x", "x", "o", " ", " ", " ", " ", " "])
      end
    end
  end
end
