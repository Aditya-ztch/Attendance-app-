classdef Squeeze_To_MatMulLayer1000 < nnet.layer.Layer & nnet.layer.Formattable
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
            name = 'faceNet_new.coder.Squeeze_To_MatMulLayer1000';
        end
    end


    methods
        function this = Squeeze_To_MatMulLayer1000(name)
            this.Name = name;
            this.OutputNames = {'inception_resnet_483'};
        end

        function [inception_resnet_483] = predict(this, inception_resnet_v1_)
            if isdlarray(inception_resnet_v1_)
                inception_resnet_v1_ = stripdims(inception_resnet_v1_);
            end
            inception_resnet_v1_NumDims = 4;
            inception_resnet_v1_ = faceNet_new.ops.permuteInputVar(inception_resnet_v1_, [4 3 1 2], 4);

            [inception_resnet_483, inception_resnet_483NumDims] = Squeeze_To_MatMulGraph1000(this, inception_resnet_v1_, inception_resnet_v1_NumDims, false);
            inception_resnet_483 = faceNet_new.ops.permuteOutputVar(inception_resnet_483, [2 1], 2);

            inception_resnet_483 = dlarray(single(inception_resnet_483), 'CB');
        end

        function [inception_resnet_483] = forward(this, inception_resnet_v1_)
            if isdlarray(inception_resnet_v1_)
                inception_resnet_v1_ = stripdims(inception_resnet_v1_);
            end
            inception_resnet_v1_NumDims = 4;
            inception_resnet_v1_ = faceNet_new.ops.permuteInputVar(inception_resnet_v1_, [4 3 1 2], 4);

            [inception_resnet_483, inception_resnet_483NumDims] = Squeeze_To_MatMulGraph1000(this, inception_resnet_v1_, inception_resnet_v1_NumDims, true);
            inception_resnet_483 = faceNet_new.ops.permuteOutputVar(inception_resnet_483, [2 1], 2);

            inception_resnet_483 = dlarray(single(inception_resnet_483), 'CB');
        end

        function [inception_resnet_483, inception_resnet_483NumDims1001] = Squeeze_To_MatMulGraph1000(this, inception_resnet_v1_, inception_resnet_v1_NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [inception_resnet_1, inception_resnet_1NumDims] = faceNet_new.ops.onnxSqueeze(inception_resnet_v1_, this.Vars.const_axes__1416, inception_resnet_v1_NumDims);

            % MatMul:
            [inception_resnet_483, inception_resnet_483NumDims] = faceNet_new.ops.onnxMatMul(inception_resnet_1, this.inception_resnet_482, inception_resnet_1NumDims, this.NumDims.inception_resnet_482);

            % Set graph output arguments
            inception_resnet_483NumDims1001 = inception_resnet_483NumDims;

        end

    end

end