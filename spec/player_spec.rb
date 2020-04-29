require 'pry'

describe Player do

  let(:name) { "Zara" }
  let(:play) { Player.new(name) }
  subject { play }

  describe "penalty box" do
    it "starts out free of penalty" do
        expect(subject.instance_variable_get(:@in_penalty_box)).to be(false)
    end

    it "goes to penalty box" do
      subject.go_in_penalty_box
      expect(subject.instance_variable_get(:@in_penalty_box)).to be(true)
    end

    it "still in penalty box" do
      subject.still_in_penalty_box?
      expect(subject.instance_variable_get(:@is_getting_out_of_penalty_box)).to be(false)
    end

    it "getting out of penalty box" do
      subject.getting_out_of_penalty_box
      expect(subject.instance_variable_get(:@is_getting_out_of_penalty_box)).to be(true)
    end
  end

  describe "banking" do
    it "starts off empty" do
      subject.bank
      expect(subject.instance_variable_get(:@bank)).to eq(0)
    end

    it "increments bank account" do
      subject.bank_roll
      expect(subject.instance_variable_get(:@bank)).to eq(1)
    end

    it "when you win" do
      subject.instance_variable_set(:@bank, 6)
      expect(subject.winner?).to be(true)
    end
  end

  describe "location" do
    let(:steps_forward) {11 }
    let(:steps_backward) { 15 }
    it "starts of empty" do
      subject.location
      expect(subject.instance_variable_get(:@places)).to eq(0)
    end

    it "moves location forward" do
      subject.move_location(steps_forward)
      expect(subject.instance_variable_get(:@places)).to eq(11)
    end

    it "moves location backword if EXCEED_LIMIT" do
      subject.move_location(steps_backward)
      expect(subject.instance_variable_get(:@places)).to eq(3)
    end
  end
end
