module HavenOnDemand

using HttpCommon
using JSON
using Requests

       # types.jl
export HODClient,
       HODIndex,
       HODSyncResponse,
       HODAsyncResponse,
       HODException,
       DocumentException,

       # client.jl
       create_index,
       parse_index,
       has_index,
       get_index,
       delete_index,
       list_indexes,
       post,
       post_async,
       call_API,
       get_async_result,

       # index.jl
       size,
       push_doc,
       push_docs,
       commit,
       add_doc,
       add_docs,
       delete,

       # responses.jl
       json,
       get_result

       # exceptions.jl
       Base.showerror

const DOCUMENTS = AbstractString[]

include("types.jl")
include("client.jl")
include("responses.jl")
include("index.jl")
include("exceptions.jl")

end # module
