from collections import defaultdict, deque
import xlrd

class Graph(object):
    def __init__(self):
        self.nodes = set()
        self.edges = defaultdict(list)
        self.distances = {}
        self.intervals = {}

    def add_node(self, value):
        self.nodes.add(value)

    def add_edge(self, from_node, to_node, distance,interval):
        self.edges[from_node].append(to_node)
        #self.edges[to_node].append(from_node)
        self.distances[(from_node, to_node)] = distance
        self.intervals[(from_node, to_node)] = interval


def dijkstra(graph, initial):
    visited = {initial: 0}
    path = {}

    nodes = set(graph.nodes)

    while nodes:
        min_node = None
        for node in nodes:
            if node in visited:
                if min_node is None:
                    min_node = node
                elif visited[node] < visited[min_node]:
                    min_node = node
        if min_node is None:
            break

        nodes.remove(min_node)
        current_weight = visited[min_node]

        for edge in graph.edges[min_node]:
            try:
                weight = current_weight + graph.distances[(min_node, edge)]
            except:
                continue
            if edge not in visited or weight < visited[edge]:
                visited[edge] = weight
                
                path[edge] = min_node
    
    return visited, path


def shortest_path(graph, visited,paths,origin, destination):
    #visited, paths = dijkstra(graph, origin)
    full_path = deque()
    _destination = paths[destination]

    while _destination != origin:
        full_path.appendleft(_destination)
        _destination = paths[_destination]

    full_path.appendleft(origin)
    full_path.append(destination)

    return visited[destination], list(full_path)

def get_minflow_interval(graph,path):
    cost = []
    min_inter = 0
    max_inter = 0
    for i in range(1,len(path)):
        cost.append(graph.distances[(path[i-1],path[i])])
        min_inter = min_inter+g.intervals[(path[i-1],path[i])][0]
        max_inter = max_inter+g.intervals[(path[i-1],path[i])][1]
    return min(cost),[min_inter,max_inter]

def update_graph(g,min_flow,path):
    for i in range(1,len(path)):
        dist = g.distances[(path[i-1],path[i])] - min_flow
        if(dist == 0):
            g.edges[path[i-1]].remove(path[i])
            g.distances.pop((path[i-1],path[i]),None)
            g.intervals.pop((path[i-1],path[i]),None)
        else:
            g.distances[(path[i-1],path[i])] = dist
            g.add_edge(path[i],path[i-1],min_flow,g.intervals[(path[i-1],path[i])])

#def chkForAllRemPaths(deadline,ip,paths):
 #   for i in range(ip,len(paths)):
        
            
if __name__ == '__main__':
    graph = Graph()

    g = Graph()

    filepath = "E:\sem-8\DAA\graph.xlsx"
    #open_file(path,g)

    book = xlrd.open_workbook(filepath)
    
    # print number of sheets
    #print (book.nsheets)
    # print sheet names
    #print (book.sheet_names())
    # get the first worksheet
    first_sheet = book.sheet_by_index(0)
    # read a row
    #print (first_sheet.row_values(0))
    # read a cell
    cell = first_sheet.cell(0,0)
    #print (cell)
    #print (cell.value)
    # read a row slice
    #print (first_sheet.row_slice(rowx=0,
    #                            start_colx=0,
    #                            end_colx=2))
    
    cells = first_sheet.row_slice(rowx=0)
    for cell in cells:
    #    print (cell.value)
        g.add_node(cell.value)

    for i in range(1,first_sheet.nrows):
        cells = first_sheet.row_slice(rowx=i)
        data = []
        for cell in cells:
            data.append(cell.value)
            
        g.add_edge(data[0],data[1],data[2],[data[3],data[4]])

    task = {}
    second_sheet = book.sheet_by_index(1)
    for i in range(0,second_sheet.nrows):
        cells = second_sheet.row_slice(rowx=i)
        data = []
        for cell in cells:
            data.append(cell.value)
            
        task.update({data[0]:[data[1],data[2]]})
    
    '''
    g.add_edge('s', 'a', 5,[3,5])
    g.add_edge('s', 'b', 5,[2,4])
    g.add_edge('s', 'c', 5,[2,4])
    g.add_edge('a', 'e', 3,[2,4])
    g.add_edge('b', 'c', 3,[1,3])
    g.add_edge('b', 'f', 7,[3,5])
    g.add_edge('b', 'e', 3,[2,4])
    g.add_edge('c', 'f', 5,[2,4])
    g.add_edge('e', 'd', 8,[0,2])
    g.add_edge('f', 'e', 1,[1,3])
    g.add_edge('f', 'd', 7,[1,3])
    '''
    v,p=dijkstra(g,'s')
    paths = {}
    count=1
    while p:
        if 'd' in p:
            cost,path = shortest_path(graph,v,p,'s', 'd')
            min_flow,interval = get_minflow_interval(g,path)
            paths.update({count:[path,min_flow,interval,min_flow]})
            print(min_flow)
            print(interval)
            update_graph(g,min_flow,path)
            count+=1
            v,p=dijkstra(g,'s')
        else:
            break
    else:
        print("no more paths")

    #sort tasks
    temp = sorted(task.items(), key=lambda e: e[1][1])
    sort = []
    for key, value in temp:
       sort.append(key)

    tempPath = paths
    ip = 1
    unallocatedTask = []
     
    #allocate tasks
    for i in range(0,len(sort)):
        print("__________________________________________")
        print("For task : %d." % (i+1))
        tkfl = task.get(sort[i])[0]
        print("Task flow is :",tkfl)
        #print("before")
        #print("flow : %d"% tkfl)
        #print("path : %s"% paths[ip])
        stopFlag = 0
        while int(tkfl) > 0 :
            
            #check if deadline is within interval
            deadline = task.get(sort[i])[1]
            interval = paths[ip][2]
            print("deadline is : ",deadline," path interval is : ", paths[ip][2]," path iter : ", ip)
            if int(deadline) < int(interval[0]) or int(deadline) > int(interval[1]):
                ip = ip + 1
                print("in deadline if")
                if i >= len(sort) or ip >= len(paths):
                    print("Task : ", (i+1) , "cannot be allocated in the remaining paths.")
                    ip = 1
                    unallocatedTask.append(sort[i])
                    break
                continue
            
            print("Allocating in the path : ", ip , paths[ip] ,"Remaining task to allocate : ",tkfl)
            tkfl = int(tkfl)
            
            if tkfl >= paths[ip][3] :
                ip=ip+1
                if ip > len(paths):
                    stopFlag = 1
                    break
                tkfl = tkfl - paths[ip][3]
                if(tkfl <0):
                    tkfl = 0
                #print("Next path taken = ",paths[ip])
                
            else:
                paths[ip][3] = abs(tkfl-paths[ip][3])
                #rem = 0
                tkfl = 0
            print("Allocating in the path : ", ip , paths[ip] ,"Remaining task to allocate : ",tkfl)
            
        if stopFlag == 1:
            print("No more paths to allocate")
            break
    print("Unallocated tasks are ; ",unallocatedTask)
