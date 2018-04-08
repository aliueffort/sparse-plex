function result  = omp_ar(Dict, X, K, epsilon, options)
    if(isobject(Dict))
        Dict = double(Dict);
    end
    if ~isa(Dict, 'double')
        error('Dict must be a double matrix');
    end
    if nargin < 5
        options = struct;
    end
    if ~isfield(options, 'norm_factor')
        options.norm_factor = 2;
    end
    if ~isfield(options, 'reset_interval')
        options.reset_interval = 5;
    end
    if ~isfield(options, 'VERBOSE')
        options.VERBOSE = false;
    end

    [M, S] = size(X);
    N = size(Dict, 2);
    sparse_output  = 1;
    result = mex_omp_ar(Dict, X, K, epsilon, sparse_output);
end
