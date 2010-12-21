    require 'test/unit'
    require './game'

    class TC_MyTest < Test::Unit::TestCase
       def setup
	@game = Game.new
       end

      # def teardown
      # end

      def test_no_rolls_zero_score
        assert(@game.score == 0)
      end

      def test_gutterball_game_zero_score
	roll_many(20,0)

	assert(@game.score == 0)
      end

      def test_consistent_single_pin
	roll_many(20,1)

	assert_equal(20,@game.score)
      end

      def test_spare_plus_1_roll
	@game.roll(5)
	@game.roll(5)
	@game.roll(3)
        roll_many(17,0)	
	
	assert_equal(16,@game.score)
      end

      def test_strike_frame_and_2_rolls
	
	@game.roll(10)
	@game.roll(5)
	@game.roll(3)
	roll_many(17,0)
	
	assert_equal(26, @game.score)
      end

      def test_perfect_game
	roll_many(11,10)

	assert_equal(300,@game.score)
      end

      def roll_many(time,score)
	time.times do
	  @game.roll(score)
	end
      end
 end
