require 'spec_helper'


describe Questionaire do

  describe "Question and Categories" do

    let(:questions) { Questionaire.new() }
    subject { questions }

    before do
      subject.set_questions
    end

    context "when current_category Pop" do
      let(:category_selection) { [ 0, 4, 8].sample }
      it "removes a question from Pop" do
        subject.ask_question(category_selection)
        expect(subject.instance_variable_get(:@pop_questions).size).to eq(49)
      end
    end

    context "when current_category Science" do
      let(:category_selection) { [ 1, 5, 9].sample }
      it "removes a question from Science" do
        subject.ask_question(category_selection)
        expect(subject.instance_variable_get(:@science_questions).size).to eq(49)
      end
    end

    context "when current_category Sports" do
      let(:category_selection) { [2, 6, 10].sample }
      it "removes a question from Sports" do
        subject.ask_question(category_selection)
        expect(subject.instance_variable_get(:@sports_questions).size).to eq(49)
      end
    end

    context "when current_category Rock" do
      let(:category_selection) { [] }
      it "removes a question from Rock" do
        subject.ask_question(category_selection)
        expect(subject.instance_variable_get(:@rock_questions).size).to eq(49)
      end
    end
  end
end
