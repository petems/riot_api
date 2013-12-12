 module RiotApi
   module Resource
     class BaseV21 < Base
       def endpoint_precursor
         "#{@region}/v2.1"
       end
     end
   end
 end
