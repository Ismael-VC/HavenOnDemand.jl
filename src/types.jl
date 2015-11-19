type HODClient
    root                :: AbstractString
    api_key             :: AbstractString
    version             :: VersionNumber
    api_default_version :: VersionNumber
    proxy               :: Dict

    function HODClient(
            root                :: AbstractString,
            api_key             :: AbstractString,
            version             :: VersionNumber   = v"1",
            api_default_version :: VersionNumber   = v"1",
            proxy               :: Dict            = Dict()
        )
        if endswith(root, '/')
            root = root[1:end-1]
        end
        new(root, api_key, version, api_default_version, proxy)
    end
end

abstract HODResponse

type HODSyncResponse <: HODResponse
    response :: HttpCommon.Response
    client   :: HODClient
end

type HODAsyncResponse <: HODResponse
    response :: HttpCommon.Response
    client   :: HODClient
    job_id   :: Int

    function HODAsyncResponse(response::HttpCommon.Response, client::HODClient)
        job_id = JSON.parse(bytestring(response.data))["jobID"]
        new(response, client, job_id)
    end
end

type HODIndex
    client :: HODClient
    name   :: AbstractString
end

type HODException <: Exception
    response_json :: Dict
    error_code    :: Int
end

type DocumentException <: Exception end
