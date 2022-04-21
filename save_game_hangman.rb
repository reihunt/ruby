class Main
    def initialize
      @word = words.sample
      @lives = 7
      @word_teaser = ""

      @word.first.size.times do
        @word_teaser += "_ "
      end
    end
  
    def words
      [
        ["bongda", "Môn thể thao"],
        ["TrungChien", "đó là một Món ăn"],
        ["celebrate", "Remembering special moments"],
        ["continent", "There are 7 of these"],
        ["exotic", "Not from around here..."],
      ]
    end
  
    def print_teaser last_guess = nil
      update_teaser(last_guess) unless last_guess.nil?
      puts @word_teaser
    end
  
    def update_teaser last_guess
      new_teaser = @word_teaser.split
  
      new_teaser.each_with_index do |letter, index|
        # replace blank values with guessed letter if matches letter in word
        if letter == '_' && @word.first[index] == last_guess
          new_teaser[index] = last_guess
        end
      end
  
      @word_teaser = new_teaser.join(' ')
    end

    def save_games
      
    end
    def make_guess
      if @lives > 0
        puts "Nhập từ dự đoán của bạn"
       # guess = gets
        #guess ||= ''
        #guess.chomp!
        guess = gets.chomp
  
        good_guess = @word.first.include? guess
  
        if guess == "exit"
          puts "Hẹn gặp lần sau!"
          
        #if guess is longer than 1 letter
        elsif guess.length > 1
          puts "Đoán một từ một lần thôi bạn trẻ!"
            make_guess
          
        elsif good_guess
          puts "Chính xác!"
  
          print_teaser guess
  
          if @word.first == @word_teaser.split.join
            puts "Thắng rồi!!!"
            print "Bạn có muốn lưu lại chứ? "
            input = gets.chomp
            if input == 'save'
              puts "Enter player name:"
              player_name = gets.chomp
	      point = @lives
            File.write('C:\Users\vudao\Downloads\rankingbroad.txt', '#{player_name} : #{point}', mode: 'a')
            elsif 
              puts "Bye bye"
            end
          else
            make_guess
          end
        else
          @lives -= 1
          puts "Còn #{ @lives } mạng thôi, hãy thử từ khác đi!"
          make_guess
        end
      else
        puts "Game over... Em đen lắm =))"
      end
    end
  
    def begin
      # ask user for a letter
      puts("Nhập '1' để vào game\nNhập '2' để xem xếp hạng\nNhập bất kì từ khác để thoát")
      choose= gets.chomp
      case choose
        when "1"
          puts "Trò chơi bất đầu... Từ này có #{ @word.first.size } kí tự"
          puts "Nhập vào từ exit để thoát "
          print_teaser
          puts "Gợi ý là: #{ @word.last }"
          make_guess
        when "2"
          puts"Xếp hạng"
        else puts"Tạm biệt"
      end
     
    end
  
  end
  
  game = Main.new
  game.begin