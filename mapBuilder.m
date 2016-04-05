classdef mapBuilder
    % __author__ = Yepoch
    
    properties
        basicStation_loop = 0
        basicStation_perNum = 6
        basicStation_num = 0
        basicStation_coordinate = 0
        basicStation_range = 1*500
        basicStation_centerRange = 0.6*500
        basicStation_relativeAngle = pi/3*(0:6);
    end
    
    methods
        function obj = mapBuilder(loop)
            obj.basicStation_loop = loop;
        end
        
        function basicStationCreator(obj)
            basicStation_bottle_relativeAngle = -pi/2-pi/3*(0:6);
            basicStation_bottle_coordinate = 0;
            for k=1:1:obj.basicStation_loop
                basicStation_bottle_coordinate = basicStation_bottle_coordinate+sqrt(3)*obj.basicStation_range*exp(1i*pi/6);
                for pp=1:1:obj.basicStation_perNum
                    for p=1:k
                        obj.basicStation_num = obj.basicStation_num+1;
                        obj.basicStation_coordinate(1,obj.basicStation_num) = basicStation_bottle_coordinate;
                        basicStation_bottle_coordinate = basicStation_bottle_coordinate+sqrt(3)*obj.basicStation_range*exp(1i*basicStation_bottle_relativeAngle); 
                    end
                end
            end
        end
        
        function printer(obj)
            figure;
            hold on;
            axis square;
            plot(obj.basicStation_range*exp(1i*obj.basicStation_relativeAngle),'k','linewidth',2);
            for k=1:1:obj.basicStation_num
                zp = obj.basicStation_coordinate(1,k)+obj.basicStation_range*exp(1i*obj.basicStation_relativeAngle);
                g1 = fill(real(zp),imag(zp),'k');
                set(g1,'FaceColor',[1,0.5,0],'edgecolor',[1,0,0]);
                text(real(obj.basicStation_coordinate(1,k)),imag(obj.basicStation_coordinate(1,k)),num2str(k),'fontsize','10');
            end
        end
        
    end
    
end

