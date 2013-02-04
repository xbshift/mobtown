module EventHelper

  def expand_events(events, look_ahead)
    expanded_events = []
    events.each do |event|
      occurrences = event.schedule.occurrences(Date.today + look_ahead)
      occurrences.each do |occurrence|
        event_instance = Marshal::load(Marshal.dump(event)) # deep copy
        event_instance.starts_at = occurrence
        expanded_events.push event_instance
      end
    end
    return expanded_events.sort_by { |e| e.starts_at }
  end

end
