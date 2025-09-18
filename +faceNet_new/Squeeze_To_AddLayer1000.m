classdef Squeeze_To_AddLayer1000 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.

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
        % Specify the path to the class that will be used for codegen
        function name = matlabCodegenRedirect(~)
            name = 'faceNet_new.coder.Squeeze_To_AddLayer1000';
        end
    end


    methods
        function this = Squeeze_To_AddLayer1000(name)
            this.Name = name;
            this.OutputNames = {'Bottleneck_BatchNorm'};
        end

        function [Bottleneck_BatchNorm] = predict(this, inception_resnet_v1_)
            if isdlarray(inception_resnet_v1_)
                inception_resnet_v1_ = stripdims(inception_resnet_v1_);
            end
            inception_resnet_v1_NumDims = 4;
            inception_resnet_v1_ = faceNet_new.ops.permuteInputVar(inception_resnet_v1_, [4 3 1 2], 4);

            [Bottleneck_BatchNorm, Bottleneck_BatchNormNumDims] = Squeeze_To_AddGraph1000(this, inception_resnet_v1_, inception_resnet_v1_NumDims, false);
            Bottleneck_BatchNorm = faceNet_new.ops.permuteOutputVar(Bottleneck_BatchNorm, ['as-is'], 2);

            Bottleneck_BatchNorm = dlarray(single(Bottleneck_BatchNorm), repmat('U', 1, max(2, Bottleneck_BatchNormNumDims)));
        end

        function [Bottleneck_BatchNorm] = forward(this, inception_resnet_v1_)
            if isdlarray(inception_resnet_v1_)
                inception_resnet_v1_ = stripdims(inception_resnet_v1_);
            end
            inception_resnet_v1_NumDims = 4;
            inception_resnet_v1_ = faceNet_new.ops.permuteInputVar(inception_resnet_v1_, [4 3 1 2], 4);

            [Bottleneck_BatchNorm, Bottleneck_BatchNormNumDims] = Squeeze_To_AddGraph1000(this, inception_resnet_v1_, inception_resnet_v1_NumDims, true);
            Bottleneck_BatchNorm = faceNet_new.ops.permuteOutputVar(Bottleneck_BatchNorm, ['as-is'], 2);

            Bottleneck_BatchNorm = dlarray(single(Bottleneck_BatchNorm), repmat('U', 1, max(2, Bottleneck_BatchNormNumDims)));
        end

        function [Bottleneck_BatchNorm, Bottleneck_BatchNormNumDims1001] = Squeeze_To_AddGraph1000(this, inception_resnet_v1_, inception_resnet_v1_NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [inception_resnet_1, inception_resnet_1NumDims] = faceNet_new.ops.onnxSqueeze(inception_resnet_v1_, this.Vars.const_axes__1416, inception_resnet_v1_NumDims);

            % MatMul:
            [inception_resnet_483, inception_resnet_483NumDims] = faceNet_new.ops.onnxMatMul(inception_resnet_1, this.inception_resnet_482, inception_resnet_1NumDims, this.NumDims.inception_resnet_482);

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