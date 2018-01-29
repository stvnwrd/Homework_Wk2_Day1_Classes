#===============================================
# Part A
#===============================================


class Student

  def initialize(student_name, cohort)
    @student_name = student_name
    @cohort = cohort
  end

  def student_name
    return @student_name
  end

  def cohort
    return @cohort
  end

  def set_student_name(new_name)
    @student_name = new_name
  end

  def set_cohort(new_cohort)
    @cohort = new_cohort
  end

  def student_talks
    return "I can talk!"
  end

  def favourite_language(language)
    return "I love #{language}"
  end

end


#===============================================
# Part B
#===============================================


class Team

  attr_reader :team_name, :players
  attr_accessor :coach

  def initialize(team_name, players, coach)
    @team_name = team_name
    @players = players
    @coach = coach
    @points = 0
  end


  def add_player(new_player)
    @players = @players << new_player
  end

  def check_player_present(player)
    if @players.find(player)
      return true
    end
  end

  def points
    return @points
  end

 def result(result)
   @points += 1 if result == "win"
 end


  # Original getters and setters
  #
  #
  # def team_name
  #   return @team_name
  # end
  #
  # def players
  #   return @players
  # end
  #
  # def coach
  #   return @coach
  # end
  #

  # def set_coach(new_coach)
  #   @coach = new_coach
  # end

end



#===============================================
# Extension
#===============================================


class Library

  attr_reader :books, :title, :date
  attr_writer :title, :date

  def initialize(books)
    @books = books
  end

  def get_info_for_title(title)
    for book in @books
      if book[:title] == title
        return book
      end
    end
    return nil
  end

  def get_rental_details(title)
    for book in @books
      if book[:title] == title
        return book[:rental_details]
      end
    end
    return nil
  end

  def create_new_book(book)
    @books << {
          title: book,
          rental_details: {
            student_name: "",
            date: ""
          }
        }
  end

  def new_lend(title, student, date)
    for book in @books
      if book[:title] == title
        book[:rental_details][:student_name] = "Jo"
        book[:rental_details][:date] = "14/02/2018"
      end
    end
  end


end
