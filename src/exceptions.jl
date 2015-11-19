function Base.showerror(io::IO, error::HODException)
    details = contains(error.response_json, "detail") ?
                       error.response_json["details"] :
                       error.response_json
    code = error.code
    _error = error.response_json["error"]
    reason = error.response_json["reason"]
    print(
        io,
        "Response code $code - Error $_error - $reason\nDetails: $details"
    )
end
