require 'spec_helper'

describe UglyTrivia::Game do

  let(:questionaire) { Questionaire.new() }
  let(:game) { UglyTrivia::Game.new(questionaire) }

  describe "Players" do
    let(:player1) { "Zara" }
    let(:player2) { "Ziba" }
    before do
      players.each { |player| game.add(player) }
      allow_any_instance_of(UglyTrivia::Game).to receive(:how_many_players) { num_of_players }
    end

    context "added to the game" do
      subject { game }

      context "when 2 or more players" do
        let(:num_of_players) { 2 }
        let!(:players) { [player1, player2] }

        it "name is added to instance of players" do
          player = subject.instance_variable_get(:@players)
          expect(player.map(&:name)).to eq(["Zara", "Ziba"])
        end

        it "game is playable" do
          expect(subject.is_playable?).to eq("Lets Play!")
        end
      end

      context "when single player" do
        let(:players) { [player1] }
        let(:num_of_players) { 1 }

        it "name is added to instance of players" do
          player = subject.instance_variable_get(:@players)
          expect(player.map(&:name)).to eq(["Zara"])
        end

        it "game is not playable" do
          expect(subject.is_playable?).to eq("Need more Players")
        end
      end

      context "when no players" do
        let(:players) { [] }
        let (:num_of_players) { 0 }

        it "no name is added to instance of players" do
          expect(subject.instance_variable_get(:@players)).to be_empty
        end

        it "game is not playable" do
          expect(subject.is_playable?).to eq("Need more Players")
        end
      end
    end
  end

  describe "The Game" do

    let(:player1) { "Zara" }
    let(:player2) { "Ziba" }
    let!(:players) { [player1, player2] }
    let(:num_of_players) { 2 }

    before do
      players.each { |player| game.add(player) }
      allow_any_instance_of(UglyTrivia::Game).to receive(:how_many_players) { num_of_players }
    end

    context "rolling the dice" do
      subject { game }

      context "not enough players" do
        let!(:players) { [player1] }
        let(:num_of_players) { 1 }

        it "cannot play game" do
          expect(subject.is_playable?).to eq("Need more Players")
        end
      end

      context "sets current_player" do

        it "shows current_player" do
          current_player = subject.instance_variable_get(:@players)[subject.instance_variable_get(:@current_player)]
          expect(current_player.name).to eq("Zara")
        end
      end

      context "when current_player is in_penalty_box" do
        before {  subject.send(:current_player).go_in_penalty_box }

        context "if roll is odd" do

          it "player gets out of penalty box" do
            subject.roll(5)
            expect(subject.send(:current_player).still_in_penalty_box?).to be(true)
          end
        end

        context "when roll is even" do

          it "player stays in plenty box" do
            subject.roll(8)
            expect(subject.send(:current_player).still_in_penalty_box?).to be(false)
          end
        end
      end

      context "when current_player is not in the plenty box" do

        it "sets position of current_player ahead by number of theroll" do
          subject.roll(3)
          current_player_position = subject.instance_variable_get(:@places)[subject.instance_variable_get(:@current_player)]
          expect(current_player_position).to eq(3)
        end
      end
    end

    describe "Answering Questions" do
      subject { game }

      context "when correctly answering" do

        context "when in plenty box" do

          before {  subject.send(:current_player).go_in_penalty_box }

          context "trying to get out of plently box" do

            before { subject.instance_variable_set(:@is_getting_out_of_penalty_box, true) }

            context "not getting out of the penalty box" do
              let!(:current_player_score) { [5] }

              before do
                subject.instance_variable_set(:@purses, current_player_score)
                subject.send(:current_player).getting_out_of_penalty_box
              end

              it "games continues with no winner" do
                expect(subject.was_correctly_answered).to be(false)
              end
            end

            context "is getting out of the penalty box" do
              let!(:current_player_position) { 1 }

              it "winner winner chicken dinner" do
                expect(subject.was_correctly_answered).to be(true)
              end
            end
          end

          context "will stay in plenty box" do
            let!(:current_player_position) { 0 }

            before { subject.instance_variable_set(:@is_getting_out_of_penalty_box, false) }

            it "goes to next player" do
              subject.was_correctly_answered
              expect(subject.instance_variable_get(:@current_player)).to eq(1)
              current_player = subject.instance_variable_get(:@players)[subject.instance_variable_get(:@current_player)]
              expect(current_player.name).to eq("Ziba")
            end
          end
        end

        context "when not in plenty box" do

          context "current_player doesn't score a win" do
            let!(:current_player_score) { [5] }

            before { subject.instance_variable_set(:@purses, current_player_score) }

            it "games continues with no winner" do
              expect(subject.was_correctly_answered).to be(false)
            end
          end

          context "current_player wins" do
            let!(:current_player_position) { 1 }

            it "winner winner chicken dinner" do
              expect(subject.was_correctly_answered).to be(true)
            end
          end
        end
      end

      context "when incorrectly answering questions" do
        let!(:current_player_position) { 1 }

        it "puts current_player in the penalty_box" do
          subject.wrong_answer
          subject.send(:next_player) #forces player1 to be current player for testing propose only
          expect(subject.send(:current_player).in_penalty_box?).to eq(true)
        end
      end
    end

  end

end
