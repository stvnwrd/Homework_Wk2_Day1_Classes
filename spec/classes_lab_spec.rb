require ('minitest/rg')
require ('minitest/autorun')
require_relative ('../classes_lab')


class TestClassesLab < MiniTest::Test

  #===============================================
  # Part A
  #===============================================



  def test_student_name
    student = Student.new("Hector", 75)
    assert_equal("Hector", student.student_name())
  end

  def test_cohort_number
    student = Student.new("Hector", 75)
    assert_equal(75, student.cohort())
  end

  def test_set_student_name
    student = Student.new("Hector", 75)
    student.set_student_name("Englebert")
    assert_equal("Englebert", student.student_name())
  end

  def test_set_cohort_name
    student = Student.new("Hector", 75)
    student.set_cohort(99)
    assert_equal(99, student.cohort())
  end

  def test_student_talks
    student = Student.new("Hector", 75)
    student.student_talks()
    assert_equal("I can talk!", student.student_talks())
  end

  def test_favourite_language
    student = Student.new("Hector", 75)
    result = student.favourite_language("JavaScript")
    assert_equal("I love JavaScript", result)
  end


#===============================================
# Part B
#===============================================

  def test_team_name
    team = Team.new("France", ["Robespierre", "Louis XVI", "Joan of Arc"], "De Gaulle")
    result = team.team_name()
    assert_equal("France", result)
  end

  def test_players
    team = Team.new("France", ["Robespierre", "Louis XVI", "Joan of Arc"], "De Gaulle")
    result = team.players()
    assert_equal(["Robespierre", "Louis XVI", "Joan of Arc"], result)
  end

  def test_players
    team = Team.new("France", ["Robespierre", "Louis XVI", "Joan of Arc"], "De Gaulle")
    result = team.coach()
    assert_equal("De Gaulle", result)
  end

  # def test_set_coach
  #   team = Team.new("France", ["Robespierre", "Louis XVI", "Joan of Arc"], "De Gaulle")
  #   team.set_coach("Macron")
  #   assert_equal("Macron", team.coach())
  # end

  def test_set_coach
    team = Team.new("France", ["Robespierre", "Louis XVI", "Joan of Arc"], "De Gaulle")
    team.coach = ("Macron")
    assert_equal("Macron", team.coach())
  end

  def test_add_new_player
    team = Team.new("France", ["Robespierre", "Louis XVI", "Joan of Arc"], "De Gaulle")
    team.add_player("Marie-Antoinette")
    assert_equal(["Robespierre", "Louis XVI", "Joan of Arc", "Marie-Antoinette"], team.players())
  end

  def test_check_player_present_true
    team = Team.new("France", ["Robespierre", "Louis XVI", "Joan of Arc"], "De Gaulle")
    assert_equal(true, team.check_player_present("Louis XVI"))
  end

  def test_check_player_present_false
    team = Team.new("France", ["Robespierre", "Louis XVI", "Joan of Arc"], "De Gaulle")
    assert_equal(true, team.check_player_present("Napoleon"))
  end

  def test_points_default_to_zero
    team = Team.new("France", ["Robespierre", "Louis XVI", "Joan of Arc"], "De Gaulle")
    assert_equal(0, team.points())
  end

  def test_win
    team = Team.new("France", ["Robespierre", "Louis XVI", "Joan of Arc"], "De Gaulle")
    team.result("win")
    assert_equal(1, team.points)
  end


#===============================================
# Extension
#===============================================

  def test_library_has_books
    library = Library.new([])
    assert_equal([], library.books)
  end

  def test_get_info_for_title
    # arrange
    book = {
      title: "Lord of the Rings",
      rental_details: {
        student_name: "Jeff",
        date: "29/01/2018"
      }
    }
    library = Library.new([book])
    # act
    book_info = library.get_info_for_title("Lord of the Rings")
    # assert
    assert_equal(book, book_info)
  end

  def test_get_rental_details
    # arrange
    book = {
      title: "Lord of the Rings",
      rental_details: {
        student_name: "Jeff",
        date: "29/01/2018"
      }
    }
    library = Library.new([book])
    # act
    rental_info = library.get_rental_details("Lord of the Rings")
    # assert
    assert_equal({
      student_name: "Jeff",
      date: "29/01/2018"
    }, rental_info)
  end


  def test_create_new_book
    # arrange
    book = {
      title: "Lord of the Rings",
      rental_details: {
        student_name: "Jeff",
        date: "29/01/2018"
      }
    }
    library = Library.new([book])
    # act
    library.create_new_book("War and Peace")
    # assert
    assert_equal("War and Peace", library.books[1][:title])
  end

  def test_new_lend
    # arrange
    book = {
      title: "Lord of the Rings",
      rental_details: {
        student_name: "Jeff",
        date: "29/01/2018"
      }
    }
    library = Library.new([book])
    # act
    library.new_lend("Lord of the Rings", "Jo", "14/02/2018")

    # assert
    assert_equal("Lord of the Rings", library.books[0][:title])
    assert_equal("Jo", library.books[0][:rental_details][:student_name])
    assert_equal("14/02/2018", library.books[0][:rental_details][:date])
  end


end
