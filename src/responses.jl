function json(response::HODSyncResponse, client::HODClient)
    JSON.parse(bytestring(response.response.data))
end

function get_result(response::HODAsyncResponse, client::HODClient)
    get_async_result(client, response.job_id)
end
