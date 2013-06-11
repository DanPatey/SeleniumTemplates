require File.join(File.dirname(__FILE__), 'media')

class Polls

  def insert(question,choices,paragraph)
    poll_activator = $driver.find_element(:id => "poll-creation-activator")
    Media.drag_and_drop(poll_activator, 1)
    get_create_poll_window_elements
    get_choice_inputs_and_check_length(1)
    create_poll(question,choices)
    verify_poll_added_successfully(question,choices)
  end

  def move

  end

  def delete

  end

  def get_create_poll_window_elements
    @create_poll_window = $wait.until { $driver.find_element(:id => "add-poll-lightbox") }
    @create_poll_window.find_element(:css => "div.header h3").text  == "Add Poll"
    @question_input = $wait.until { $driver.find_element(:id => "poll-question") }
  end

  def get_choice_inputs_and_check_length(expected=2)
    @choice_inputs = $driver.find_elements(:class => "poll-choice")
    @choice_inputs_length = @choice_inputs.length
    @choice_inputs_length.should == expected
  end

  def create_poll(question, choices)
    s = Time.now.to_i
    @question_input.send_keys(question)
    expected = 2
    choices.each_with_index do |choice, index|
      expected+=1
      @choice_inputs[index].send_keys(choice)
      @choice_inputs[index].send_keys(:tab)
      get_choice_inputs_and_check_length(expected)
    end
    @save_poll =  $driver.find_element(:class => "poll-save")
    @save_poll.click
    sleep(10)
    $wait.until { $driver.find_element(:class => "has_content") }
    $wait.until { $driver.find_element(:class => "media_area_title") }
    $th.end_timer(s,"insert_poll")
  end

  def edit(poll,question, choices)
    @question_input.send_keys(question)
    @question_input.send_keys(:tab)
    choices.each_with_index do |choice, index|
      @choice_inputs[index].send_keys(choice)
      @choice_inputs[index].send_keys(:tab)
    end
    @save_poll =  $driver.find_element(:class => "poll-save")
    @save_poll.location_once_scrolled_into_view
    @save_poll.click
    sleep(10)
    $wait.until { $driver.find_element(:class => "has_content") }
    $wait.until { $driver.find_element(:class => "media_area_title") }
  end
  
  def verify_poll_added_successfully(question,choices)
    question_h4 = $long_wait.until { 
      $driver.find_element(:css => "h4.poll-question")
    }
    question_h4.text.should == question
    choices.each_with_index do |choice, i |
      $driver.find_elements(:class => "poll-text")[i].text.
      should == choice
    end
    @polls_in_article = $driver.find_elements(:class => "media_area_poll")
    @edit_polls = $driver.find_elements(:class => "add-poll")
    @submit_poll = $driver.find_element(:class => "poll-submit")
  end

end