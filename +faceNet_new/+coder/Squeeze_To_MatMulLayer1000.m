classdef Squeeze_To_MatMulLayer1000 < nnet.layer.Layer & nnet.layer.Formattable
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
            this_cg = faceNet_new.coder.Squeeze_To_MatMulLayer1000(mlInstance);
        end
        function this_ml = matlabCodegenFromRedirected(cgInstance)
            this_ml = faceNet_new.Squeeze_To_MatMulLayer1000(cgInstance.Name);
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
        function this = Squeeze_To_MatMulLayer1000(mlInstance)
            this.Name = mlInstance.Name;
            this.OutputNames = {'inception_resnet_483'};
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

        function [inception_resnet_483] = predict(this, inception_resnet_v1___)
            if isdlarray(inception_resnet_v1___)
                inception_resnet_v1__ = stripdims(inception_resnet_v1___);
            else
                inception_resnet_v1__ = inception_resnet_v1___;
            end
            inception_resnet_v1_NumDims = 4;
            inception_resnet_v1_ = faceNet_new.coder.ops.permuteInputVar(inception_resnet_v1__, [4 3 1 2], 4);

            [inception_resnet_483__, inception_resnet_483NumDims__] = Squeeze_To_MatMulGraph1000(this, inception_resnet_v1_, inception_resnet_v1_NumDims, false);
            inception_resnet_483_ = faceNet_new.coder.ops.permuteOutputVar(inception_resnet_483__, [2 1], 2);

            inception_resnet_483 = dlarray(single(inception_resnet_483_), 'CB');
        end

        function [inception_resnet_483, inception_resnet_483NumDims1001] = Squeeze_To_MatMulGraph1000(this, inception_resnet_v1_, inception_resnet_v1_NumDims, Training)

            % Execute the operators:
            % Squeeze:
            [inception_resnet_1, inception_resnet_1NumDims] = faceNet_new.coder.ops.onnxSqueeze(inception_resnet_v1_, this.Vars.const_axes__1416, inception_resnet_v1_NumDims);

            % MatMul:
            [inception_resnet_483, inception_resnet_483NumDims] = faceNet_new.coder.ops.onnxMatMul(inception_resnet_1, this.inception_resnet_482, inception_resnet_1NumDims, this.NumDims.inception_resnet_482);

            % Set graph output arguments
            inception_resnet_483NumDims1001 = inception_resnet_483NumDims;

        end

    end

end