classdef Squeeze_To_AddLayer1000 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.
    %#codegen

    %#ok<*PROPLC>
    %#ok<*NBRAK>
    %#ok<*INUSL>
    %#ok<*VARARG>
    properties (Learnable)
        inception_resnet_482
    end

    properties (State)
    end

    properties
        Vars
        NumDims
    end

    methods(Static, Hidden)
        % Specify the properties of the class that will not be modified
        % after the first assignment.
        function p = matlabCodegenNontunableProperties(~)
            p = {
                % Constants, i.e., Vars, NumDims and all learnables and states
                'Vars'
                'NumDims'
                'inception_resnet_482'
                };
        end
    end


    methods(Static, Hidden)
        % Instantiate a codegenable layer instance from a MATLAB layer instance
        function this_cg = matlabCodegenToRedirected(mlInstance)
            this_cg = faceNet_new.coder.Squeeze_To_AddLayer1000(mlInstance);
        end
        function this_ml = matlabCodegenFromRedirected(cgInstance)
            this_ml = faceNet_new.Squeeze_To_AddLayer1000(cgInstance.Name);
            if isstruct(cgInstance.Vars)
                names = fieldnames(cgInstance.Vars);
                for i=1:numel(names)
                    fieldname = names{i};
                    this_ml.Vars.(fieldname) = dlarray(cgInstance.Vars.(fieldname));
                end
            else
                this_ml.Vars = [];
            end
            this_ml.NumDims = cgInstance.NumDims;
            this_ml.inception_resnet_482 = cgInstance.inception_resnet_482;
        end
    end

    methods
        function this = Squeeze_To_AddLayer1000(mlInstance)
            this.Name = mlInstance.Name;
            this.OutputNames = {'Bottleneck_BatchNorm'};
            if isstruct(mlInstance.Vars)
                names = fieldnames(mlInstance.Vars);
                for i=1:numel(names)
                    fieldname = names{i};
                    this.Vars.(fieldname) = faceNet_new.coder.ops.extractIfDlarray(mlInstance.Vars.(fieldname));
                end
            else
                this.Vars = [];
            end

            this.NumDims = mlInstance.NumDims;
            this.inception_resnet_482 = mlInstance.inception_resnet_482;
        end

        function [Bottleneck_BatchNorm] = predict(this, inception_resnet_v1___)
            if isdlarray(inception_resnet_v1___)
                inception_resnet_v1__ = stripdims(inception_resnet_v1___);
            else
                inception_resnet_v1__ = inception_resnet_v1___;
            end
            inception_resnet_v1_NumDims = 4;
            inception_resnet_v1_ = faceNet_new.coder.ops.permuteInputVar(inception_resnet_v1__, [4 3 1 2], 4);

            [Bottleneck_BatchNorm__, Bottleneck_BatchNormNumDims__] = Squeeze_To_AddGraph1000(this, inception_resnet_v1_, inception_resnet_v1_NumDims, false);
            Bottleneck_BatchNorm_ = faceNet_new.coder.ops.permuteOutputVar(Bottleneck_BatchNorm__, ['as-is'], 2);

            Bottleneck_BatchNorm = dlarray(single(Bottleneck_BatchNorm_), repmat('U', 1, max(2, Bottleneck_BatchNormNumDims__)));
        end

        function [Bottleneck_BatchNorm, Bottleneck_BatchNormNumDims1001] = Squeeze_To_AddGraph1000(this, inception_resnet_v1_, inception_resnet_v1_NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [inception_resnet_1, inception_resnet_1NumDims] = faceNet_new.coder.ops.onnxSqueeze(inception_resnet_v1_, this.Vars.const_axes__1416, inception_resnet_v1_NumDims);

            % MatMul:
            [inception_resnet_483, inception_resnet_483NumDims] = faceNet_new.coder.ops.onnxMatMul(inception_resnet_1, this.inception_resnet_482, inception_resnet_1NumDims, this.NumDims.inception_resnet_482);

            % Mul:
            inception_resnet_485 = inception_resnet_483 .* this.Vars.inception_resnet_484;
            inception_resnet_485NumDims = max(inception_resnet_483NumDims, this.NumDims.inception_resnet_484);

            % Add:
            Bottleneck_BatchNorm = inception_resnet_485 + this.Vars.inception_resnet_486;
            Bottleneck_BatchNormNumDims = max(inception_resnet_485NumDims, this.NumDims.inception_resnet_486);

            % Set graph output arguments
            Bottleneck_BatchNormNumDims1001 = Bottleneck_BatchNormNumDims;

        end

    end

end